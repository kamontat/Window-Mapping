# Window-Mapping
เมื่อเราถนัดใช้แมค แต่ดันจำเป็นต้องมาใช้ window ความชิบหายจึงเกิดขึ้น เมื่อเรากด cmd+S เพื่อจะ save ก็ดันเป็น window อะไรก็ไม่รู้โผล่มาแทน เฮ่ออ 
เนี้ยแหละ แอพนี้มีไว้เพื่อการนี้โดยเฉพาะ

# มีอะไรบ้าง
1. สลับการใช้งาน (<kbd>command</kbd> / <kbd>window_key</kbd>) กับ <kbd>control</kbd>
2. สามารถกด <kbd>Caps Lock</kbd> เพื่อเปลื่ยนภาษา
3. สามารถกด <kbd>command</kbd> + <kbd>space</kbd> เพื่อ ค้นหา ไฟล์หรือโฟรเดอร์ (Spotlight)

# สำหรับผู้ใช้ทั่วไป
- คุณจะเจอเวอร์ชั่นล่าสุดได้ที่ [link](https://github.com/kamontat/Window-Mapping/releases/latest) **หรือ** คุณสามารถโหลดเวอร์ชั่นล่าสุดได้ที่ [ดาวน์โหลด](https://github.com/kamontat/Window-Mapping/raw/master/production/remapping_key.exe) ลิงค์ (แต่การดาวน์โหลดแบบนี้อาจจะทำให้ได้เวอร์ชั่นที่ไม่เสถียรได้)
- คุณสามารถรันโปรแกรมได้โดย คลิกไปที่โปรแกรม (จะมี *การแจ้งเตือน* บอกว่ารัน version อะไรอยู่) 
- มีหลากหลายวิธีที่จะออกจากโปรแกรม (ปล. การออกจากโปรแกรมอาจจะมีช่วงเวลาในการออก โปรดรอซักครู่):
  1. กด <kbd>control</kbd> + <kbd>shift</kbd> + <kbd>q</kbd> เทื่อออก เมื่อออกเสร็จแล้วจะมี *การแจ้งเตือน*
  2. ที่ toolbar (ขวาล่างของ TaskBar) จะมีบอกว่ารันโปรมแกรมอยู่ เราสามารถกดเมาส์ขวา เพื่อออกได้
  3. หากยังไม่สมารถออกได้ ให้ใช้ `Task Manager` เพื่ออกมัน
  4. หากยังไม่สามารถออกได้อีก ก็ `restart computer`
  
# สำหรับนักพัฒนา
## เงื่อนไขก่อนพัฒนา
1. ต้องลงโปรแกรม [AutoHotKey](https://github.com/kamontat/Window-Mapping/blob/master/library/AutoHotkey_1.1.25.01_setup.exe) ก่อน หรือ หาจากเว็บที่  https://autohotkey.com/
2. อ่าน document ให้แน่ชัด [link](https://autohotkey.com/docs/AutoHotkey.htm)
3. ลองโหลดโปรแกรมธรรมดามารันก่อนว่าได้ไหม [SimpleApp](https://autohotkey.com/docs/Tutorial.htm#s12)

## การพัฒนา
ตามความต้องการ 

## ปัญหา หรือ Bug
- สามารถบอกได้ที่ https://github.com/kamontat/Window-Mapping/issues
