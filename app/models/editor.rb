class Editor < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :softwares


  validates :website, presence: true, length: {maximum: 150} 
 
               validates :name, presence: true, length: {maximum: 75} 

               validates :job, presence: true, length: {maximum: 75} 
 
               validates :fullname, presence: true, length: {maximum: 75}

               validates :telephone, numericality: true, presence: true, length: {maximum: 15} 

               validates :entreprise, presence: true, length: {maximum: 150} 

               validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@gmail\.com\z/,
                message: "Uniquement des emails professionnels" }
               validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@hotmail\.com\z/,
                  message: "Uniquement des emails professionnels" }
               validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@hotmail\.fr\z/,
                    message: "Uniquement des emails professionnels" }
               validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@yahoo\.fr\z/,
                      message: "Uniquement des emails professionnels" }
                validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@yahoo\.com\z/,
                        message: "Uniquement des emails professionnels" }
                validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@free\.fr\z/,
                          message: "Uniquement des emails professionnels" }
                validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@orange\.fr\z/,
                            message: "Uniquement des emails professionnels" }
                validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@sfr\.fr\z/,
                              message: "Uniquement des emails professionnels" }
                validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@skynet\.be\z/,
                                message: "Uniquement des emails professionnels" }
                validates :email, format: { without: /\b[A-Z0-9._%a-z\-]+@live\.fr\z/,
                                  message: "Uniquement des emails professionnels" }
end
