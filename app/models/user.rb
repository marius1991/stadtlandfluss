class User < ActiveRecord::Base
  has_many :scores
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username ,
            :presence => {:message => "darf nicht leer sein"},
            :format =>{ :with => /\A[a-zA-Z0-9]+\Z/,
                        :message => "darf keine Leerzeichen enthalten"},
            on: :create, on: :update

end
