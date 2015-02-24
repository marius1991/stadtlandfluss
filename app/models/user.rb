class User < ActiveRecord::Base
  #belongs_to :game
  #has_many :rounds
  has_many :scores

  validates :name ,
            :presence => {:message => "cant be blank"},
            :format =>{ :with => /\A[a-zA-Z0-9]+\Z/,
                        :message => ": No blankspace allowed!"},
            on: :create, on: :update

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, on: :update
  has_secure_password :message => "darf nicht leer sein!"
  validates_presence_of :password, :on => :create, on: :update
  validates_presence_of :password_confirmation, :on => :create, on: :update





end
