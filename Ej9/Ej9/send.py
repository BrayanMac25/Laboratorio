#!/usr/bin/env python3
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
import sys

msg = MIMEMultipart()
msg['From'] = ""
msg['To'] = correo
msg['Subject'] = titulo_msg
message = "Se han revisado los puertos estos son los resultados"
msg.attach(MIMEText(message, 'plain'))
archivo_adjunto = open(resultados.txt, 'rb')
adjunto_MIME = MIMEBase('application', 'octet-stream')
adjunto_MIME.set_payload((archivo_adjunto).read())
encoders.encode_base64(adjunto_MIME)
adjunto_MIME.add_header('Content-Disposition', "attachment; filename= %s" % nombre_adjunto)
mensaje.attach(adjunto_MIME)
server = smtplib.SMTP('smtp.office365.com:587')
server.starttls()
server.login('', '')
server.sendmail(msg['From'], msg['To'], msg.as_string())
server.quit()
print("successfully sent email to %s:" % (msg['To']))
