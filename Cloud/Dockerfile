FROM python:3.8

WORKDIR /work
COPY Config.yaml .
COPY requirements.txt .
COPY Controller.py .

RUN pip install -r requirements.txt

CMD python3 /work/Controller.py -v -i 10.84.63.0/24 -c /work/Config.yaml
