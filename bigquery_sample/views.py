from django.http import HttpResponse
from google.cloud import bigquery
from django.shortcuts import render

table_stories = 'bigquery-public-data.hacker_news.stories'
table_github = 'bigquery-public-data.github_repos.sample_commits'
client = bigquery.Client()


def index(request):
    return HttpResponse("Hello, world.")


def hacker_news(request):
    query = " SELECT title, author, time_ts FROM " + \
        table_stories + " ORDER BY time_ts DESC LIMIT 5"

    query_job = client.query(query)

    results = query_job.result()

    return render(request, 'stories.html', {'stories': results})


def github(request):
    query = "SELECT author.name AS author_name, COUNT(*) AS commits FROM " + table_github + \
        " WHERE EXTRACT(YEAR FROM committer.date) = 2016 GROUP BY (author.name) ORDER BY commits DESC"

    query_job = client.query(query)

    results = query_job.result()

    return render(request, 'commits.html', {'commits': results})
