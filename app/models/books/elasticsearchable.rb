module Books
  module Elasticsearchable
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks

      # ①index名
      index_name "es_rails7_#{Rails.env}"

      # ②mapping情報
      settings do
        mappings dynamic: 'false' do
          indexes :id,        type: 'integer'
          indexes :title,     type: 'text'
          indexes :auther,    type: 'text'
          indexes :publisher, type: 'text'
          indexes :series,    type: 'text'
        end
      end

      # ③mappingの定義に合わせてindexするドキュメントの情報を生成する
      def as_indexed_json(*)
        attributes
          .symbolize_keys
          .slice(:id, :title, :auther, :publisher, :series)
      end
    end

    class_methods do
      # ④indexを作成するメソッド
      def create_index!
        client = __elasticsearch__.client
        # すでにindexを作成済みの場合は削除する
        client.indices.delete index: self.index_name rescue nil
        # indexを作成する
        client.indices.create(index: self.index_name,
          body: {
            settings: self.settings.to_hash,
            mappings: self.mappings.to_hash
          })
      end

      def search(keyword)
        __elasticsearch__.search({
          size: 10000,
          query: {
            bool: {
              must: [
                { multi_match: {
                    fields: %w(title auther publisher series),
                    type: 'cross_fields',
                    query: keyword,
                    operator: 'and'
                }}
              ]
            }
          }
        })
      end
    end
  end
end