%%
unix('mkdir /Volumes/Temp/');
%%
unix('mount_webdav https://dhqidyj9ohs666g3bdcr27u.webdav.drivehq.com /Volumes/Temp/');

%%
AvrdudeAddress = '/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avrdude';
AvrdudeConf = '/Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf';
Device = 'atmega328p';
Programer_id = 'arduino';
USBPort = '/dev/cu.usbmodem411';
BaudRate = '115200';
HexFile = '/Volumes/Temp/ArduinoTest/Blink_copy_100.ino.hex';

while exist(HexFile, 'file') ~= 2
    disp(['Waiting for file ' HexFile])
    pause(2)
end

Command = [AvrdudeAddress...
    ' -C' AvrdudeConf...
    ' -v'...
    ' -p' Device...
    ' -c' Programer_id...
    ' -P' USBPort...
    ' -b' BaudRate...
    ' -D '...
    '-Uflash:w:' HexFile ':i'];
unix(Command)

%%
unix('diskutil unmount /Volumes/Temp/');
