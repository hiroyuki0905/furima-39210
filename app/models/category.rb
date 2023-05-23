class category < ActiveHash::Base
  self.data = [
    {id: 1, name: 'メンズ'},
    {id: 2, name: 'レディース'},
    {id: 3, name: 'インテリア'},
    {id: 4, name: '本'},
    {id: 5, name: 'スポーツ'},
    {id: 6, name: 'ゲーム'}
  ]
end