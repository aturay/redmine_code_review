# Code Review plugin for Redmine
# Copyright (C) 2009  Haruyuki Iida
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

class AddActionType < ActiveRecord::Migration
  def self.up
    add_column(:code_reviews, "action_type", :string)
    add_column(:code_reviews, "file_path", :string)
    add_column(:code_reviews, "rev", :string)
    add_column(:code_reviews, "rev_to", :string)
    CodeReview.update_all("action_type = 'diff'")
  end

  def self.down
    remove_column(:code_reviews, "action_type")
    remove_column(:code_reviews, "file_path")
    remove_column(:code_reviews, "rev")
    remove_column(:code_reviews, "rev_to")
  end
end
