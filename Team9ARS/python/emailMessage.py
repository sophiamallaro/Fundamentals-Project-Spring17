# Send an email message from user's account

import base64
from email.mime.text import MIMEText

import mimetypes
import os

from apiclient import errors


def sendMessage(service, user_id, message):
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


def createMessage(sender, to, subject, message_text):
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
    return {'raw': base64.urlsafe_b64encode(message.as_string())}
