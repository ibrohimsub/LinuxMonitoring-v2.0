#!/bin/bash

agent=$(($RANDOM%10))
if [[ $agent -eq 0 ]]; then
	agent='(Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' #Google Chrome
elif [[ $agent -eq 1 ]]; then
	agent='(Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0' #Mozilla Firefox
elif [[ $agent -eq 2 ]]; then
	agent='(Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko' #Internet Explorer
elif [[ $agent -eq 3 ]]; then
	agent='(Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 OPR/96.0.0.0 (Edition Yx 05)' #Opera
elif [[ $agent -eq 4 ]]; then
	agent='(Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.57' #Microsoft Edge
elif [[ $agent -eq 5 ]]; then
	agent='(Windows NT 6.2; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2' #Safari
elif [[ $agent -eq 6 ]]; then
	agent='(compatible; PRTG Network Monitor (www.paessler.com); Windows)' #Crawler
elif [[ $agent -eq 7 ]]; then
	agent='(compatible; YandexBot/3.0; +http://yandex.com/bots)' #Bot
elif [[ $agent -eq 8 ]]; then
	agent='(compatible; PostmanRuntime/7.26.5; Windows)' #Library
elif [[ $agent -eq 9 ]]; then
	agent='(compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)' #Net tool
	fi

