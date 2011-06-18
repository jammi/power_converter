
class PowerConverter < GUIPlugin
  def convert( msg, kw )
    ses = get_ses( msg )
    ses[:power_kw ].set( msg, kw.round )
    ses[:power_ps ].set( msg, (kw*1.36).round )
    ses[:power_bhp].set( msg, (kw*1.341).round )
  end
  def from_kw( msg, value )
    convert( msg, value.data )
    true
  end
  def from_ps( msg, value )
    convert( msg, value.data*0.7352941176 )
    true
  end
  def from_bhp( msg, value )
    convert( msg, value.data*0.7457121551 )
    true
  end
end
