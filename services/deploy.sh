#!/usr/bin/env bash

kubectl apply -f services/call-control
kubectl apply -f services/tel-switch

kubectl apply -f services/dashboards
