class AddPublishedAtToPosts < ActiveRecord::Migration[6.1]
  def up
    # Adicionar o atributo published_at com o formato datetime e que também
    # aceita o valor nulo
    add_column :posts, :published_at, :datetime, null: true

    # Atualiza os posts existentes atribuindo a data atual como a de
    # publicação
    Post.all.each{|post| post.update_attribute(:published_at, Date.current)}
  end

  def down
    # Remove o campo published_at em caso de rollback da migration
    remove_column :posts, :published_at
  end
end
