#!mruby
#GR-CITRUS Version 2.15

#ESP8266を一度停止させる(リセットと同じ)
pinMode(5,1)
digitalWrite(5,0)   # LOW:Disable
delay 500
digitalWrite(5,1)   # LOW:Disable

Usb = Serial.new(0,115200)

if( System.useWiFi() == 0)then
    Usb.println "WiFi Card can't use."
   System.exit() 
end
Usb.println "WiFi Ready"

Usb.println "WiFi Get Version"
Usb.println WiFi.version

Usb.println "WiFi disconnect"
Usb.println WiFi.disconnect

Usb.println "WiFi Mode Setting"
Usb.println WiFi.setMode 3  #Station-Mode & SoftAPI-Mode

Usb.println "WiFi ipconfig"
Usb.println WiFi.ipconfig

Usb.println "WiFi connecting"
Usb.println WiFi.connect("TAROSAY","37000")
#Usb.println WiFi.connect("000740DE0D79","")

Usb.println "WiFi ipconfig"
Usb.println WiFi.ipconfig

Usb.println "WiFi multiConnect Set"
Usb.println WiFi.multiConnect 1

heds=["User-Agent: curl"]
Usb.println "HTTP GET Start"
Usb.println WiFi.httpGetSD("main.mrb","www.geocities.jp/momoonga/iot/main.mrb").to_s

Usb.println "WiFi disconnect"
Usb.println WiFi.disconnect
