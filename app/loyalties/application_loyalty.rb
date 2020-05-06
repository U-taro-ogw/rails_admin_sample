class ApplicationLoyalty
  attr_reader :admin, :record

  def initialize(user, record)
    raise Banken::NotAuthorizedError, "must be logged in" unless user
    @admin = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  private
    def role_A?
      admin.role_A?
    end

    def role_B?
      admin.role_B?
    end

    def role_C?
      admin.role_C?
    end

    def all_role
      admin.role_A? || admin.role_B? || admin.role_C?
    end
end
