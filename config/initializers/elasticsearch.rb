Elasticsearch::Model.client =
  Elasticsearch::Client.new(
    hosts: [
      {
        host: 'elasticsearch',
        port: '9200'
      }
    ],
    url: ENV.fetch("BONSAI_URL") { 'http://localhost' }
  )