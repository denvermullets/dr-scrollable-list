class ScrollableList
  def initialize(args, names, options = {})
    @args = args
    @names = names
    @scroll_area_width = options[:width] || 340
    @scroll_area_height = options[:height] || 340
    @line_height = options[:line_height] || 30
    @top_padding = options[:top_padding] || 20
    @buffer_zone = options[:buffer_zone] || 30
    @scroll_area_x = (1280 - @scroll_area_width) / 2
    @scroll_area_y = (720 - @scroll_area_height) / 2
    @scroll_position = 0
    @target_scroll_position = 0
  end

  def tick
    handle_input
    update_scroll_position
    render
  end

  private

  def handle_input
    handle_mouse_wheel if mouse_over_scroll_area?
  end

  def handle_mouse_wheel
    return unless @args.inputs.mouse.wheel

    @target_scroll_position -= @args.inputs.mouse.wheel.y * 20
    @target_scroll_position = @target_scroll_position.clamp(0, max_scroll)
  end

  def max_scroll
    [0, (@names.length * @line_height) - @scroll_area_height + @top_padding].max
  end

  def update_scroll_position
    @scroll_position = @scroll_position.lerp(@target_scroll_position, 0.1)
  end

  def render
    render_scroll_area
    render_names
    render_scrollbar
  end

  def render_scroll_area
    @args.outputs.solids << [@scroll_area_x, @scroll_area_y, @scroll_area_width, @scroll_area_height, 255, 255, 255]
    @args.outputs.borders << [@scroll_area_x, @scroll_area_y, @scroll_area_width, @scroll_area_height, 0, 0, 0]
  end

  def render_names
    visible_range.each { |index| render_name(index) if name_visible?(index) }
  end

  def visible_range
    start_index..end_index
  end

  def start_index
    [(@scroll_position - @top_padding) / @line_height, 0].max.floor
  end

  def end_index
    [((@scroll_position + @scroll_area_height - @top_padding) / @line_height).ceil, @names.length - 1].min
  end

  def render_name(index)
    @args.outputs.labels << [@scroll_area_x + 10, calculate_y_position(index), @names[index], 0, 0, 0]
  end

  def name_visible?(index)
    y_position = calculate_y_position(index)
    y_position >= @scroll_area_y + @buffer_zone &&
      y_position - @line_height <= @scroll_area_y + @scroll_area_height - @buffer_zone
  end

  def calculate_y_position(index)
    @scroll_area_y + @scroll_area_height - ((index + 1) * @line_height) + @scroll_position + @top_padding
  end

  def render_scrollbar
    return unless max_scroll.positive?

    scrollbar_height = (@scroll_area_height * (@scroll_area_height / (@names.length * @line_height.to_f))).clamp(30, @scroll_area_height)
    scrollbar_position = @scroll_area_y + (@scroll_area_height - scrollbar_height) - (@scroll_position / max_scroll) * (@scroll_area_height - scrollbar_height)
    @args.outputs.solids << [@scroll_area_x + @scroll_area_width - 10, scrollbar_position, 10, scrollbar_height, 200, 200, 200]
  end

  def mouse_over_scroll_area?
    @args.inputs.mouse.inside_rect? [@scroll_area_x, @scroll_area_y, @scroll_area_width, @scroll_area_height]
  end
end