import webbrowser

from googleapiclient import discovery

from emailMessage import createMessage
from emailMessage import sendMessage
from oauth2client.client import flow_from_clientsecrets
from httplib2 import Http


def main():
    flow = flow_from_clientsecrets('../../../client_secret.json',
                                   scope='https://mail.google.com',
                                   redirect_uri='urn:ietf:wg:oauth:2.0:oob')

    auth_url = flow.step1_get_authorize_url()
    webbrowser.open_new(auth_url)

    auth_code = raw_input('Enter the auth_code: ')

    credentials = flow.step2_exchange(auth_code)
    http_auth = credentials.authorize(Http())

    gmail_service = discovery.build('gmail', 'v1', http_auth)

    email_text = "ars email test\nline two"
    sender = "team9ars@gmail.com"
    to = "jason-ryan@uiowa.edu"
    subject = "Gmail API test"

    message = createMessage(sender, to, subject, email_text)

    sendMessage(gmail_service, 'me', message)


if __name__ == '__main__':
    main()