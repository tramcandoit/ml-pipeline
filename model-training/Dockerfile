FROM python:3.10

WORKDIR /model-training
COPY . .

RUN pip install -r requirements.txt

RUN pip install awscli

ENTRYPOINT ["python", "run.py"]