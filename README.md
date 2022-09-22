# pubsub-ordering-key

Example for GCP PubSub pull subscription with message ordering enabled

## High-level steps

1. Create a pubsub topic
2. Create a pubsub pull subscription with Message ordering enabled
3. Start multiple (ex. 3) pubsub subscribers with asynchronous pull
4. Publish messages with random ordering key (ex. random with K1 to K5)

For the messages that have the same ordering key and are in the same region, you can enable message ordering and receive the messages in the order that the Pub/Sub service receives them.

Messages with the same ordering key are guaranteed to be delivered in order.

Messages with different ordering keys are not guaranteed to be delivered in order, independent of the publishing time.

## Setup your shell and gcp project

Setup gcloud

```bash
export PROJECT_ID=<your project id>
export TOPIC=ordering-topic
export SUBSCRIPTION=ordering-subscription
gcloud auth login
gcloud config set project ${PROJECT_ID}
```

Clone this repository

```bash
git clone https://github.com/nuttea/pubsub-ordering-key.git
cd pubsub-ordering-key
export WORKING_DIR=${pwd}
npm install
```

Enable PubSub service

```bash
gcloud services enable pubsub.googleapis.com --project=${PROJECT_ID}
```

## Create PubSub Topic and Subscription

```bash
gcloud pubsub topics create ${TOPIC}

gcloud pubsub subscriptions create ${SUBSCRIPTION} \
  --enable-message-ordering \
  --topic=${TOPIC}
```

## Run nodejs async pull subscribers

The example is nodejs pubsub client with 60 seconds timeout to stop listen on subscription.

Open a new terminal (ex. 3 terminals) and start node

```bash
cd <your clone repo directory>
npm run test
```

## Publish messages with random ordering key

On your first terminal run publish.sh script to publish messages to the topic with random ordering keys in K1 to K5

```bash
./publish.sh
```

You can check the result on each subscriber terminal where messages with the same ordering key will be received in order and to the same subscriber.