class CCConfig {
  static final settings = {
    "stages": [
      {
        "name": 'intro',
        "title": 'Test Bank ID verification',
      },
      {
        "name": "consent",
        "title": "Custom Consent Screen Title",
      },
      {
        "name": 'documentCapture',
        "showGuidance": true,
        "useMLAssistance": false,
        "liveCapture": false,
        "retryLimit": 2,
        "documentTypes": {
          "passport": true,
          "driving_license": true,
          "national_identity_card": true,
          "residence_permit": true
        },
      },
      {
        "name": "faceCapture",
        "mode": "photo",
        // Enable ML assistance during capture
        "useMLAssistance": false,
      },
      {
        "name": "poaCapture",

        // When disabled, the client will be forced to perform a live capture
        "liveCapture": false,
      },
      {
        "name": "complete",
        "heading": "Thank you!",
        "message": "Your KYC submission has been completed.",
      },
    ],
    // ...
    "lookAndFeel": {
      // Primary action button background color
      // "primaryButtonBgColor": '#FFFF00',

      // Force SDK to 'dark', 'light', or 'inherit' mode
      "uiInterfaceStyle": "inherit"
    }
  };

  static getSettings(String clientId, String token) {
    return {
      //  "clientID": "672e19b80fb087000820a1b5",
      // "clientToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjoiWlRFNU9HRmpZelUzTWpSaU4yUTNOREF6WVdVMU5XWXdOemt3WkdVeU5HUXlNekJpWlRjM05ESXdNMkUzTXpRMk5ETXlNakUwWVRJMk5URTFOemsxTUdJMk9UTm1ZVFF6TkRkaVlXVTNOVFJqTUdSbE0yRmhOekU0WkdFeU5qRm1NR0poTkRka016TXlOR1ZrWmpJM01qaGhZelJoT1RGbE5UQXhaV1JtTVRReU9EVTFPV1ZoWkRaaE5HWXhaRFV5TWpCa1ptSXhZMlZqT0RCa1ptRXdOVGxsTlRRMVpEa3hNRGt4TXpJeFpXSTJNall6WldOaVpXUTVZV1UyTVRJNVl6ZGlNekl3T0dFd04yTTROamRoTkRBeE5UZGhOemMyTWpSak56Rm1aRFF4WmpkbE9EVXlaREEzTm1WaU5HRTJabVZpWmpNMU1XWmpPRFkxTlRrM1lUWTJZemM0TkRkbE16YzFNekl5TURrME9UTTVPR0k1WTJFME1XUTVaREU0IiwidXJscyI6eyJhcGkiOiJodHRwczovL2FwaS5jb21wbHljdWJlLmNvbSIsInN5bmMiOiJ3c3M6Ly94ZHMuY29tcGx5Y3ViZS5jb20iLCJjcm9zc0RldmljZSI6Imh0dHBzOi8veGQuY29tcGx5Y3ViZS5jb20ifSwib3B0aW9ucyI6eyJoaWRlQ29tcGx5Q3ViZUxvZ28iOmZhbHNlLCJlbmFibGVDdXN0b21Mb2dvIjp0cnVlLCJlbmFibGVUZXh0QnJhbmQiOnRydWUsImVuYWJsZUN1c3RvbUNhbGxiYWNrcyI6dHJ1ZSwiZW5hYmxlTmZjIjpmYWxzZSwiaWRlbnRpdHlDaGVja0xpdmVuZXNzQXR0ZW1wdHMiOjUsImRvY3VtZW50SW5mbGlnaHRUZXN0QXR0ZW1wdHMiOjIsIm5mY1JlYWRBdHRlbXB0cyI6NSwiZW5hYmxlQWRkcmVzc0F1dG9jb21wbGV0ZSI6dHJ1ZSwiZW5hYmxlV2hpdGVMYWJlbGluZyI6dHJ1ZX0sImlhdCI6MTczMjE5MDA1MSwiZXhwIjoxNzMyMTkzNjUxfQ.1LtaUKBgLvWdbTyfvwgTFH0k4VQDZKnM7Rjm1kDWiKM",
      ...settings,
    };
  }
}
