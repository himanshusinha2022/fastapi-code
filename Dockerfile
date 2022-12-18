# python base image in the container from Docker Hub
FROM python:3.11.0

# copy files to the /app folder in the container
COPY ./main.py /app/main.py
COPY ./models.py /app/models.py
COPY ./routes.py /app/routes.py
COPY ./.env /app/.env


# set the working directory in the container to be /app
WORKDIR /app

# install the packages from the Pipfile in the container
RUN pip install fastapi
RUN pip install fastapi uvicorn
RUN pip install python-dotenv
RUN pip install aiohttp
RUN pip install azure-cosmos
RUN pip install routes

# expose the port that uvicorn will run the app on
ENV PORT=8001
EXPOSE 8001

# execute the command python main.py (in the WORKDIR) to start the app
CMD ["python", "main.py"]