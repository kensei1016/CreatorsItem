crumb :root do
  link "トップページ", root_path
end

crumb :recommend_items do
  link "おすすめ", recommend_items_work_rooms_path
end

crumb :new_items do
  link "新着", new_items_work_rooms_path
end

crumb :creator_genre do |creator_genre|
  link creator_genre.name, work_rooms_path(genre_id: creator_genre.id)
end

crumb :tag do |tag_name|
  link tag_name, work_rooms_path(tag_name: tag_name)
end

crumb :work_room do |work_room|
  
  link "作業部屋詳細", work_room_path

  request_referer = request.referer
  # おすすめ一覧からの遷移
  if request_referer&.include?("recommend_items")
    parent :recommend_items
  # 新着一覧からの遷移
  elsif request_referer&.include?("new_items")
    parent :new_items
  # ジャンル検索からの遷移
  elsif request_referer&.include?("genre_id")
    parent :creator_genre, work_room.creator_genre
  # タグ検索からの遷移
  elsif request_referer&.include?("tag_name")
    # 遷移元ページのパラメータをhashに変換して取り出す
    uri = URI::parse(request.referer)
    begin
      q_array = URI::decode_www_form(uri.query)
      q_hash = Hash[q_array]
    rescue
      q_hash = {}
    end

    parent :tag, q_hash["tag_name"]
  # トップページからの遷移（もしくはURL指定）
  else
    parent :root
  end
  
end

def referer_params_to_hash(referer)
  
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).