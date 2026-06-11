# Sendmail Gmail or GMX Linux

[العربية](#-الوصف-العربي) | [English](#-english-description)

---

## 🌍 الوصف العربي

### 📧 حول المشروع

سكريبت قوي وسهل الاستخدام يساعدك على إرسال رسائل بريد إلكترونية من خادم Linux الخاص بك باستخدام Gmail أو GMX. مثالي لإرسال التقارير والإشعارات والرسائل المهمة تلقائياً.

### ✨ الميزات الرئيسية

- ✅ إرسال رسائل بريد من سطر الأوامر (CLI)
- ✅ دعم Gmail و GMX
- ✅ سهل التكوين والاستخدام
- ✅ مدعوم على أنظمة متعددة
- ✅ يعمل مع Windows WSL

### 🖥️ الأنظمة المدعومة

- Debian
- Ubuntu
- Linux Mint
- Kali Linux
- Fedora
- RedHat
- CentOS
- Windows WSL (Windows Subsystem for Linux)

### 📋 المتطلبات

- نظام تشغيل Linux أو Windows WSL
- حساب Gmail أو GMX
- Sendmail مثبت على النظام
- وصول إلى الإنترنت

### 🚀 البدء السريع

#### 1️⃣ التثبيت

```bash
git clone https://github.com/hmidani-abdelilah/sendmail-gmail-or-gmx-linux.git
cd sendmail-gmail-or-gmx-linux
chmod +x sendmail.sh
```

#### 2️⃣ الإعداد

قم بتحرير ملف الإعدادات وأدخل بيانات حسابك:

```bash
nano config.conf
```

أضف البيانات التالية:
```
EMAIL=your-email@gmail.com
PASSWORD=your-app-password
SMTP_SERVER=smtp.gmail.com
SMTP_PORT=587
```

#### 3️⃣ الاستخدام

```bash
./sendmail.sh recipient@example.com "Subject" "Message Body"
```

### 📝 أمثلة الاستخدام

**مثال 1: إرسال بريد بسيط**
```bash
./sendmail.sh user@example.com "تحية" "مرحباً بك!"
```

**مثال 2: إرسال تقرير يومي**
```bash
./sendmail.sh admin@company.com "التقرير اليومي" "$(cat report.txt)"
```

**مثال 3: استخدام مع cron للإرسال التلقائي**
```bash
0 9 * * * /home/user/sendmail-gmail-or-gmx-linux/sendmail.sh admin@example.com "Daily Report" "$(date)"
```

### 🔐 الأمان

- استخدم **App Passwords** بدلاً من كلمة المرور الأساسية
- لا تشاركِ ملف الإعدادات مع الآخرين
- استخدم الأذونات الصحيحة للملفات:
```bash
chmod 600 config.conf
```

### 📺 عرض توضيحي

[![asciicast](https://asciinema.org/a/453213.svg)](https://asciinema.org/a/453213)

### 🤝 المساهمة

نرحب بمساهماتك! يرجى:
1. Fork المشروع
2. إنشاء فرع للميزة الجديدة (`git checkout -b feature/AmazingFeature`)
3. Commit التغييرات (`git commit -m 'Add AmazingFeature'`)
4. Push إلى الفرع (`git push origin feature/AmazingFeature`)
5. فتح Pull Request

### 📄 الترخيص

هذا المشروع مرخص تحت MIT License - انظر ملف [LICENSE](LICENSE) للتفاصيل.

### 📞 الدعم

للمساعدة والدعم، يرجى فتح issue أو التواصل عبر:
- GitHub Issues
- البريد الإلكتروني

---

## 🌍 English Description

### 📧 About the Project

A powerful and user-friendly script that helps you send emails from your Linux server using Gmail or GMX accounts. Perfect for automated reports, notifications, and important messages.

### ✨ Key Features

- ✅ Send emails from command line (CLI)
- ✅ Support for Gmail and GMX
- ✅ Easy to configure and use
- ✅ Supports multiple Linux distributions
- ✅ Works with Windows WSL

### 🖥️ Supported Systems

- Debian
- Ubuntu
- Linux Mint
- Kali Linux
- Fedora
- RedHat
- CentOS
- Windows WSL (Windows Subsystem for Linux)

### 📋 Requirements

- Linux operating system or Windows WSL
- Gmail or GMX account
- Sendmail installed on your system
- Internet access

### 🚀 Quick Start

#### 1️⃣ Installation

```bash
git clone https://github.com/hmidani-abdelilah/sendmail-gmail-or-gmx-linux.git
cd sendmail-gmail-or-gmx-linux
chmod +x sendmail.sh
```

#### 2️⃣ Configuration

Edit the configuration file and enter your account details:

```bash
nano config.conf
```

Add the following information:
```
EMAIL=your-email@gmail.com
PASSWORD=your-app-password
SMTP_SERVER=smtp.gmail.com
SMTP_PORT=587
```

#### 3️⃣ Usage

```bash
./sendmail.sh recipient@example.com "Subject" "Message Body"
```

### 📝 Usage Examples

**Example 1: Send a simple email**
```bash
./sendmail.sh user@example.com "Greeting" "Hello World!"
```

**Example 2: Send a daily report**
```bash
./sendmail.sh admin@example.com "Daily Report" "$(cat report.txt)"
```

**Example 3: Use with cron for automated sending**
```bash
0 9 * * * /home/user/sendmail-gmail-or-gmx-linux/sendmail.sh admin@example.com "Daily Report" "$(date)"
```

### 🔐 Security

- Use **App Passwords** instead of your main password
- Don't share your configuration file with others
- Set proper file permissions:
```bash
chmod 600 config.conf
```

### 📺 Demo

[![asciicast](https://asciinema.org/a/453213.svg)](https://asciinema.org/a/453213)

### 🤝 Contributing

We welcome contributions! Please:
1. Fork the project
2. Create a branch for your feature (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### 📞 Support

For help and support, please open an issue or contact us via:
- GitHub Issues
- Email

---

**Made with ❤️ by [hmidani-abdelilah](https://github.com/hmidani-abdelilah)**
