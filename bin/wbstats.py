#!/usr/bin/env python
import shutil, subprocess

MOUNTS = {
    '/': 'smough',
    '/mnt/kalameet': 'kalameet',
    '/mnt/capra': 'capra',
    '/mnt/taurus': 'taurus'
}

def get_disk_usage():
    result = {}
    for path, name in MOUNTS.items():
        try:
            total, used, free = shutil.disk_usage(path)
            result[name] = free // (2**30)
        except:
            result[name] = '?'
    return result

def get_cpu_temp():
    result = subprocess.run(['sensors'], capture_output=True, text=True)
    for line in result.stdout.split('\n'):
        if 'Package' in line:
            return line[16:18]
    return '?'

def get_gpu_temp():
    result = subprocess.run(['sensors'], capture_output=True, text=True)
    for line in result.stdout.split('\n'):
        if 'edge' in line.lower():
            return line[15:17]
    return '?'

def main():
    disks = get_disk_usage()
    cpu = get_cpu_temp()
    gpu = get_gpu_temp()

    output = (f"smough {disks['smough']}GB 󰋊 │ "
              f"kalameet {disks['kalameet']}GB 󰋊 │ "
              f"capra {disks['capra']}GB 󰋊 │ "
              f"taurus {disks['taurus']}GB 󰋊 │ "
              f"󰢮 {gpu}° │  {cpu}°")
    print(output, flush=True)

if __name__ == '__main__':
    main()

