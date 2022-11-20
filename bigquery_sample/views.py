from django.http import HttpResponse
from google.cloud import bigquery
from django.shortcuts import render

table_id = 'cogent-repeater-369122.hacker_news.Stories'

client = bigquery.Client()


def index(request):
    return HttpResponse(200)


def hacker_news(request):
    # datasets = list(client.list_datasets())  # Make an API request.
    # project = client.project
    # if datasets:
    #     print("Datasets in project {}:".format(project))
    #     for dataset in datasets:
    #         print("\t{}".format(dataset.dataset_id))
    # else:
    #     print("{} project does not contain any datasets.".format(project))
    query_job = client.query(
        """
        SELECT *
        FROM """ + table_id + """
        LIMIT 10"""
    )

    results = query_job.result()
    # for row in results:
    #     print("{} : {} views".format(row.id, row.title, row.name))
    return render(request, 'stories.html', {'stories': results})


def github(request):
    return HttpResponse(200)
