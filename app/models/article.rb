class Article < ApplicationRecord
    include Visible
    #relation with comment model
    has_many :comments, dependent: :destroy
    # dependent option deleteded comments if you
    # deleted a article

    #add some validations to our model:
    validates :title, presence: true
    validates :body, presence: true, length: {
        minimum: 10
    }

    # You may be wondering where the title
    # and body attributes are defined.
    # Active Record automatically defines model attributes
    # for every table column, so you
    # don't have to declare those attributes in your model file.

end
