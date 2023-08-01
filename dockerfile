FROM python:3.7
WORKDIR /app
COPY app.py .
# COPY requirements.txt .

RUN pip install 
#--no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0", "--port", "5000"]
