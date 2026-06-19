FROM python:3.13-slim

COPY /app/app.py .

RUN pip install flask

CMD ["python3" , "app.py"]