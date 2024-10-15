import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(
            title: notification['title'],
            message: notification['message'],
            time: notification['time'],
            isRead: notification['isRead'],
            onMarkAsRead: () {
              _markAsRead(index);
            },
            onDelete: () {
              _deleteNotification(index);
            },
          );
        },
      ),
    );
  }

  void _markAsRead(int index) {
    notifications[index]['isRead'] = true;
    Get.snackbar('Notification', 'Marked as read', snackPosition: SnackPosition.BOTTOM);
  }

  void _deleteNotification(int index) {
    notifications.removeAt(index);
    Get.snackbar('Notification', 'Notification deleted', snackPosition: SnackPosition.BOTTOM);
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final VoidCallback onMarkAsRead;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.onMarkAsRead,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: isRead ? Colors.grey[200] : Colors.white,
      child: ListTile(
        leading: Icon(Icons.notifications, color: isRead ? Colors.grey : Colors.blue),
        title: Text(title, style: TextStyle(fontWeight: isRead ? FontWeight.normal : FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 5),
            Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Mark as Read') {
              onMarkAsRead();
            } else if (value == 'Delete') {
              onDelete();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'Mark as Read',
              child: Text('Mark as Read'),
            ),
            const PopupMenuItem(
              value: 'Delete',
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> notifications = [
  {
    'title': 'Welcome to Delivery App',
    'message': 'Thank you for signing up. Enjoy our services!',
    'time': '2 hours ago',
    'isRead': false,
  },
  {
    'title': 'Order Update',
    'message': 'Your order #1234 is out for delivery.',
    'time': '5 hours ago',
    'isRead': false,
  },
  {
    'title': 'Discount Alert!',
    'message': '50% off on your next order. Use code: DISCOUNT50.',
    'time': '1 day ago',
    'isRead': true,
  },
  {
    'title': 'Feedback Request',
    'message': 'Please share your feedback to help us improve.',
    'time': '3 days ago',
    'isRead': true,
  },
];

