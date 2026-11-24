#!/usr/bin/env python3
"""MathWorld pre-release logical DB export, outside Git on an encrypted disk.
Requires Supabase CLI, Docker and age. Never restores or changes production.
"""
import argparse
import getpass
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
from datetime import datetime, timezone
import zipfile

PROJECT = 'xxwujbeamvxrqvtomrac'
FILES = ('roles.sql', 'schema.sql', 'data.sql')

def invoke(args, cwd, env=None):
    subprocess.run(args, cwd=cwd, env=env, check=True)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True, help='Private backup directory outside all Git repositories')
    args = parser.parse_args()
    os.umask(0o077)
    out = Path(args.output).expanduser().resolve()
    if any((parent / '.git').exists() for parent in (out, *out.parents)):
        parser.error('Backup directory must not be inside a Git repository')
    out.mkdir(parents=True, exist_ok=True, mode=0o700)
    for tool in ('supabase','docker','age'):
        if not shutil.which(tool):
            parser.error(f'Install {tool} before running this script')
    print('Exports MathWorld only. No restore or production migrations.')
    print('Use a local encrypted disk, not a shared or cloud-synced folder.')
    print('Separate role/schema/data dumps are not one atomic snapshot.')
    print('Arrange a consistent release window; prevent application writes and schema changes during the export.')
    if input('Type MathWorld to confirm the project and private destination: ').strip() != 'MathWorld':
        parser.error('Cancelled')
    stamp = datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%SZ')
    encrypted = out / f'mathworld-{stamp}.zip.age'
    if encrypted.exists():
        parser.error('Destination already exists')
    env = dict(os.environ)
    env['SUPABASE_DB_PASSWORD'] = getpass.getpass('Existing Supabase database password (not API key): ')
    if not env['SUPABASE_DB_PASSWORD']:
        parser.error('A database password is required')
    try:
        with tempfile.TemporaryDirectory(prefix='.mw-backup-', dir=out) as temporary:
            work = Path(temporary)
            invoke(['supabase','init'], work, env)
            invoke(['supabase','link','--project-ref',PROJECT],work,env)
            ref = work/'supabase'/'.temp'/'project-ref'
            if not ref.is_file() or ref.read_text().strip() != PROJECT:
                raise RuntimeError('Cannot verify linked project; no dump will be taken')
            help_text = subprocess.check_output(['supabase','db','dump','--help'],cwd=work,env=env,text=True)
            if '--linked' in help_text:
                remote_flag='--linked'
            elif '--remote' in help_text:
                remote_flag='--remote'
            else:
                raise RuntimeError('CLI has no recognized explicit remote-dump flag')
            for name,flags in [('roles.sql',['--role-only']),('schema.sql',[]),('data.sql',['--data-only','--use-copy'])]:
                invoke(['supabase','db','dump',remote_flag,'-f',name,*flags],work,env)
                if not (work/name).is_file() or (work/name).stat().st_size == 0:
                    raise RuntimeError(f'Missing or empty {name}')
            env.pop('SUPABASE_DB_PASSWORD',None)
            manifest={'project_ref':PROJECT,'created_utc':stamp,'scope':'Supabase CLI logical database export; not a verified restore','files':{}}
            for name in FILES:
                b=(work/name).read_bytes()
                manifest['files'][name]={'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()}
            archive=work/'backup.zip'
            with zipfile.ZipFile(archive,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=6) as z:
                for name in FILES:
                    z.write(work/name,name)
                z.writestr('manifest.json',json.dumps(manifest,indent=2))
            print('Choose a strong separate encryption passphrase in the age prompt. Save it securely.')
            partial=work/'backup.zip.age'
            invoke(['age','-p','-o',str(partial),str(archive)],work,env)
            if not partial.is_file() or not partial.stat().st_size:
                raise RuntimeError('Encryption did not create an archive')
            check=work/'verified.zip'
            invoke(['age','-d','-o',str(check),str(partial)],work,env)
            with zipfile.ZipFile(check) as z:
                for name in FILES:
                    if hashlib.sha256(z.read(name)).hexdigest()!=manifest['files'][name]['sha256']:
                        raise RuntimeError(f'Checksum mismatch: {name}')
            # Same filesystem, atomic publication without replacing a prior backup.
            os.link(partial, encrypted)
    finally:
        env.pop('SUPABASE_DB_PASSWORD',None)
    print(f'Encrypted, decrypt-verified backup: {encrypted}')
    print('Next: independent encrypted storage and local restore test. Never restore to production.')
    print('No restore, migration, storage-object backup or hosting-config backup was performed.')

if __name__=='__main__':
    main()
