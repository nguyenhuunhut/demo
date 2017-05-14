class CoursesController < ApplicationController


  def index
    @courses = Course.all
    @notications = Notication.where(id_to: @current_user, status: true)
  end

  def show
    @course = Course.find params[:id]
  end

  def search
    teacher_name = search_params[:teacher_name]
    level = search_params[:level]
    vl = Tripod::SparqlClient::Query.query("PREFIX khoahoc: <http://www.semanticweb.org/khoahoc#>
    SELECT ?id ?a
    WHERE {
  	  ?x khoahoc:Teaches ?a.
  	  ?a khoahoc:courseID ?id.
  	?a khoahoc:level ?b.
  	FILTER  regex(?b, '#{level}').
  	?x khoahoc:name ?ten.
  	FILTER  regex(?ten, '#{teacher_name}').
  	}", nil)
    kq = JSON.parse vl

    result = Course.find_by_id kq["results"]["bindings"][0]["id"]["value"]
    name = result.name

 #    course_ids = JSON.parse vl
 #    course_ids["results"]["bindings"].each do |course|
 #       course_ids << course["id"]["value"]
 #    end
 # #
 #    result = Course.where(
 #    # name = result.name
 #
 #
 #
 #    render json:{
 #   success: true,
 #   data:{
 #     id: result
 #   }
 # }



    render json:{
   success: true,
   data:{
     id: name
   }
 }

  end

  private

  def search_params
    params.permit(:teacher_name, :level)
  end
end
