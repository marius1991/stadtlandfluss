class User < ActiveRecord::Base
  #belongs_to :game
  #has_many :rounds
  has_many :scores

  validates :name ,
            :presence => {:message => "darf nicht leer sein"},
            :format =>{ :with => /\A[a-zA-Z0-9]+\Z/,
                        :message => "darf keine Leerzeichen enthalten"},
            on: :create, on: :update

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, on: :update
  has_secure_password :message => ": darf nicht leer sein!"
  validates_presence_of :password, :on => :create, on: :update, :message => "darf nicht leer sein"
  validates_presence_of :password_confirmation, :on => :create, on: :update, :message => "darf nicht leer sein"





end
