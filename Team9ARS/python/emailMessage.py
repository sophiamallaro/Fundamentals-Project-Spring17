# Send an email message from user's account

import base64
from emailMessage.mime.audio import MIMEAudio
from emailMessage.mime.base import MIMEBase
from emailMessage.mime.image import MIMEImage
from emailMessage.mime.multipart import MIMEMultipart
from emailMessage.mime.text import MIMEText
import mimetypes
import os

from apiclient import errors

def SendMessage(service, user_id, message):
    """
    Sends an email message

    :param service: Authorized Gmail API service instance
    :param user_id: User's email address. Special value "me" used to
    indicate the authenticated user
    :param message: Message to be sent
    :return: Sent message
    """
    try:
        message = (service.users().messages().send(userId=user_id, body=message)
                   .execute())
        print 'Message Id: %s' % message['id']
        return message
    except errors.HttpError, error:
        print 'An error occurred: %s' % error

def CreateMessage(sender, to, subject, message_text):
    """
    Creates a message for an email.

    :param sender: Email address of sender
    :param to: Email address of recipient
    :param subject: Subject of email
    :param message_text: Text of email message
    :return: Base64url encoded email object
    """

    message = MIMEText(message_text)
    message['to'] = to
    message['from'] = sender
    message['subject'] = subject
    return {'raw':base64.urlsafe_b64encode(message.as_string())}

def CreateMessageWithAttachment(sender, to, subject, message_text, file_dir, filename):
    """
    Create an email message with attachment.

    :param sender:
    :param to:
    :param subject:
    :param message_text:
    :param file_dir:
    :param filename:
    :return: Base64url encode email objeect
    """

    message = MIMEMultipart()
    message['to'] = to
    message['from'] = sender
    message['subject'] = subject

    msg = MIMEText(message_text)
    message.attach(msg)

    path = os.path.join(file_dir, filename)
    content_type, encoding = mimetypes.guess_type(path)

    if content_type is None or encoding is not None:
        content_type = 'application/octet-stream'
    main_type, sub_type = content_type.split('/', 1)
    if main_type == 'text':
        fp = open(path, 'rb')
        msg = MIMEText(fp.read(), _subtype=sub_type)
        fp.close()
    elif main_type == 'image':
        fp = open(path, 'rb')
        msg = MIMEImage(fp.read(), _subtype=sub_type)
        fp.close()
    elif main_type == 'audio':
        fp = open(path, 'rb')
        msg = MIMEAudio(fp.read(), _subtype=sub_type)
        fp.close()
    else:
        fp = open(path, 'rb')
        msg = MIMEBase(main_type, sub_type)
        msg.set_payload(fp.read())
        fp.close()

    msg.add_header('Content-Disposition', 'attachment', filename=filename)
    message.attach(msg)

    return {'raw': base64.urlsafe_b64encode(message.as_string())}