class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '4号サイズ(直径12cm)' },
    { id: 3, name: '5号サイズ(直径15cm)' },
    { id: 4, name: '6号サイズ(直径18cm)' },
    { id: 5, name: '7号サイズ(直径21cm)' },
    { id: 6, name: '8号サイズ(直径24cm)' }
  ]

  include ActiveHash::Associations
  has_many :items

  end