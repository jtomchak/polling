defmodule PollerDal.Questions do
  import Ecto.Query
  alias PollerDal.Repo
  alias PollerDal.Questions.Question
  alias PollerDal.Districts.District

  def create_question(attrs) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  def delete_question(%Question{} = question, attrs) do
    Repo.delete(question)
  end

  def list_questions() do
    Repo.all(Question)
  end

  def get_question!(id) do
    Repo.get!(Question, id)
  end

  def list_questions_by_district_id(id) do
    from(q in Question,
      where: q.district_id == type(^id, :integer)
    )
    |> Repo.all()
  end
end
