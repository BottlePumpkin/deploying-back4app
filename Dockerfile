FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# requirements.txt 파일 복사 및 종속성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 프로젝트의 모든 파일을 컨테이너로 복사
COPY . .

# 컨테이너의 8000 포트 노출
EXPOSE 8000

# 컨테이너 시작 시 실행할 명령어
CMD ["uvicorn", "router.main:app", "--host", "0.0.0.0", "--port", "8000"]
