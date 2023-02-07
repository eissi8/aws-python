FROM python:3


RUN pip install boto3

COPY . .

CMD [ "python", "./write-single-key.py" ]
