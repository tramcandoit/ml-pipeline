FROM python:3.10

WORKDIR /feature-engineering
COPY . .

RUN pip install -r requirements.txt

RUN pip install awscli

ENTRYPOINT ["python", "run.py"]