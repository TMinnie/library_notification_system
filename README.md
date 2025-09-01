# 📚 Library Notification System

A real-time web-based notification system for library environments. It allows administrators to broadcast messages (e.g., due date reminders, announcements) instantly to all connected users using WebSockets.

---

## 🚀 Features

- 🔒 **Role-Based Access**: Admins and users access different pages
- 💬 **Real-Time Notifications**: Instant message delivery using WebSockets
- 🧩 **JSP + Servlet Architecture**: Built with Java EE standards (Jakarta EE)
- 🗃 **In-Memory Session Management**: Secure login control with `HttpSession`
- 💾 **Message Persistence**: Uses `localStorage` to retain the latest message on reload
---

## 🛠️ Technologies Used

- Java (Jakarta EE)
- JSP / Servlets
- WebSockets (`@ServerEndpoint`)
- HTML / CSS / JavaScript
- NetBeans IDE
- GlassFish Server

---

## 🧪 How to Run

1. **Clone the repository:**

   git clone https://github.com/your-username/LibraryNotificationSystem.git

   Open in NetBeans and build the project.

2. Deploy to GlassFish Server (ensure WebSocket support is enabled).

3. Access the app in your browser:

  Admin: http://localhost:8080/LibraryNotificationSystem/serverSide.jsp

  User: http://localhost:8080/LibraryNotificationSystem/notification.jsp

⚠️ Make sure GlassFish is running and your project is deployed correctly.

---

## 📌 Notes
WebSockets handle real-time communication.

All active clients receive the message instantly.

Latest message is saved in browser storage (localStorage).
