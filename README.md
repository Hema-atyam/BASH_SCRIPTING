To configure the .msmtprc file for sending emails using msmtp, you need to specify your email provider’s SMTP server details, authentication, and security settings. Below is a template for configuring a .msmtprc file for sending emails with popular email providers like Gmail, SendGrid, or any other SMTP server.

Create/Edit .msmtprc File:

The .msmtprc file should be located in your home directory (~/.msmtprc).
Ensure that this file has the correct permissions to keep it secure, as it contains sensitive information (username, password).

chmod 600 ~/.msmtprc

# Sample Configuration for Gmail:
# .msmtprc for Gmail
# Default account to use
account default
host smtp.gmail.com
port 587
from your-email@gmail.com
auth on
user your-email@gmail.com
password "your-email-password"
tls on  

In the above config file, use an app password to provide password instead of using gmail primary password. App password can be created when two-factor authentication is enabled for that gmail account.
