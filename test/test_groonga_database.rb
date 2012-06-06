# -*- coding: utf-8 -*-
#
# @file 
# @brief
# @author ongaeshi
# @date   2010/xx/xxxx

require 'test_helper'
require 'milkode/database/groonga_database'

module Milkode
  class TestGroongaDatabase < Test::Unit::TestCase
    def test_database
      begin
        t_setup
        t_open
      ensure
        t_cleanup
      end
    end

    def t_setup
      @obj = GroongaDatabase.new
      @tmp_dir = File.join(File.dirname(__FILE__), "groonga_database_work")
    end
    
    def t_cleanup
      # 本当は明示的にcloseした方が行儀が良いのだけれど、
      # 単体テストの時にSementationFaultが出るのでコメントアウト
      # @obj.close

      # データベース削除
      @obj = nil
      FileUtils.rm_rf(@tmp_dir)
    end

    def t_open
      @obj.open(@tmp_dir)
      # @obj.close
    end

  end
end
