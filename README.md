# Chit Lite MVC

[![Node.js](https://img.shields.io/badge/Node.js-%3E%3D16.0.0-green.svg)](https://nodejs.org/)


เทมเพลตเริ่มต้น (Starter Kit) สำหรับพัฒนาเว็บแอปพลิเคชันด้วย **Node.js + Express** 
บนโครงสร้างสถาปัตยกรรม **MVC (Model-View-Controller)** 
เรียบง่าย คลีน และพร้อมนำไปต่อยอดได้ทันที

---

## 🛠 Tech Stack

- **Backend**: Node.js, Express 4
- **Template Engine**: EJS
- **Database**: MySQL (`mysql2/promise`)
- **Styling**: Tailwind CSS

---

## 🚀 Installation & Usage

### วิธีที่ 1: สร้างผ่าน CLI Tool (แนะนำ)
หากติดตั้ง `create-chit-app` ไว้ในเครื่องแล้ว สามารถรันคำสั่งนี้เพื่อสร้างโปรเจกต์ได้ทันที:
```bash
create-chit-app my-new-project
cd my-new-project
npm run dev
```

### วิธีที่ 2: Clone ด้วยตัวเอง

```bash
git clone https://github.com/Roochit/chit-lite-mvc.git
cd chit-lite-mvc
npm install
npm run dev
```

---

## 📁 โครงสร้างโปรเจกต์ (Folder Structure)

```text
chit-lite-mvc/
├── server.js              # จุดเริ่มต้นเซิร์ฟเวอร์ & เชื่อมต่อ Routes
├── src/
│   ├── config/
│   │   └── db.js          # ตั้งค่าการเชื่อมต่อฐานข้อมูล MySQL
│   ├── routes/
│   │   └── web.js         # กำหนดเส้นทาง URL เชื่อมกับ Controller
│   ├── controllers/
│   │   └── HomeController.js # ประมวลผล Logic & ส่งข้อมูลไป View
│   ├── models/
│   │   └── userModel.js   # คำสั่ง Query จัดการข้อมูล (SQL)
│   └── views/
│       └── index.ejs      # หน้าแสดงผล (EJS + Tailwind CSS)
└── public/                # ไฟล์ Assets ทั่วไป (CSS, ภาพ, Client JS)
```

---

## 🎯 จุดที่ต้องเชื่อมต่อ (สัญลักษณ์ `?`)

ในแต่ละไฟล์ได้ระบุเครื่องหมาย **`?`** ไว้ตรงจุดที่คุณต้องปรับแต่งตามโปรเจกต์ของคุณ:

1. **`src/config/db.js`**
   - เปลี่ยนชื่อฐานข้อมูลตรง `database: '?'` ให้ตรงกับ MySQL ในเครื่อง
2. **`src/models/userModel.js`**
   - เปลี่ยน `?` ในคำสั่ง SQL (เช่น `SELECT * FROM ?`) เป็นชื่อตารางจริง
3. **`src/controllers/HomeController.js`**
   - ปลดคอมเมนต์เรียกใช้ Model และส่งตัวแปรไปยัง `res.render('index', { ... })`
4. **`src/routes/web.js`**
   - เพิ่มเส้นทาง URL ใหม่และผูกเข้ากับฟังก์ชันใน Controller

---

## 📜 คำสั่งที่ใช้งานได้ (Scripts)

| คำสั่ง | หน้าที่ |
| --- | --- |
| `npm run dev` | รันเซิร์ฟเวอร์ด้วย Nodemon (รีสตาร์ทอัตโนมัติเมื่อไฟล์เปลี่ยน) |
| `npm run watch:css` | บิลด์ Tailwind CSS แบบ Watch mode (ถ้าต้องการคอมไพล์ CSS ในเครื่อง) |

