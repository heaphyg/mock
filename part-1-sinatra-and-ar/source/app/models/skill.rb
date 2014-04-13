class Skill < ActiveRecord::Base
  VALID_CONTEXTS = %w(technical creative)

  validates :name, :presence => true
  validate :validate_context

  has_many :user_skills # makes a method called 'user_skills' it will always be plural
                        # assumes class name 'UserSkill'
                        # assumes foreign key 'skill_id' on UserSkill
  has_many :practitioners, :through => :user_skills, source: :user  # :user here is on line 2 of user_skill.rb

  private
  def validate_context
    p self.context
    self.errors[:context] = "must be one of: #{VALID_CONTEXTS.join(', ')}" unless VALID_CONTEXTS.include? self.context
  end
end
