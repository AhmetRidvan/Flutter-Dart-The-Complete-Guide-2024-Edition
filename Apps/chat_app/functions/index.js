const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

// Cloud Firestore triggers ref: https://firebase.google.com/docs/functions/firestore-events
exports.myFunction = functions.firestore
  .document('chat/{messageId}')
  .onCreate((snapshot, context) => {
    const messageData = snapshot.data();
    const payload = {
      notification: {
        title: messageData.username,
        body: messageData.text,
      },
      data: {
        click_action: 'FLUTTER_NOTIFICATION_CLICK',
      },
      topic: 'chat',
    };

    return admin.messaging().send(payload);
  });