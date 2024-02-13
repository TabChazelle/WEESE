class Wine < ApplicationRecord
  searchkick word_start: [:name]
  acts_as_favoritable

  has_many :pairings
  has_many :cheeses, through: :pairings
  validates :name, presence: true, uniqueness: true
end


# before_create
# create a method of some kind. This method will be called before the object is saved to the database. If the method returns false, the object will not be saved. If the method returns true, the object will be saved. This is a great place to put any logic that needs to be executed before the object is saved to the database. For example, you might want to generate a unique slug for a blog post before it is saved to the database. You could do this by creating a method called generate_slug and then calling it with before_create.
# use the unsplash and interpolate the wine name into the url
# Can put the method in here to call before you save the new element and do the api call in here.

