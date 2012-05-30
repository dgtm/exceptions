class Failure
  include ::Mongoid::Document
  include ::Mongoid::Timestamps

  field :type
  field :message
  field :backtrace
  field :trace

  attr_accessor :count
  # before_save :markdownize!

  scope :of_the_same_type_as, ->(type) { where(:type => type) }

  # def initialize(*args)
  #   binding.pry
  #   @count = self.class.of_the_same_type_as(args.first[:type]).count
  # end


  def syntax_highlighter(text)
    CodeRay.scan(text, :ruby).div(:line_numbers => :table)
  end

  def self.notify(type, exception)
    create!(:type => type, :message => exception.message, :backtrace => exception.backtrace)
  end

  # class String
    def markdownize!
      bt = format_backtrace
      options = {:hard_wrap => true, :filter_html => true, :autolink => true, :no_intra_emphasis => true, :fenced_code_blocks => true, :space_after_headers => true}
      markdown = ::Redcarpet::Markdown.new(::Redcarpet::Render::HTML, options)
      # self.trace = markdown.render(bt).html_safe
      self.trace = bt
    end
  # end


  def format_backtrace
    backtrace.inject {|str, btrace| str.concat(btrace).concat("\n") }.html_safe
  end

  private


end