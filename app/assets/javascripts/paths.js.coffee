class KneeScum.Paths

  @areaNew:           => "/areas/new"
  @areaEdit: (areaId) => "/areas/#{areaId}/edit"

  @areaClimbs:    (areaId)          => "/areas/#{areaId}/climbs"
  @areaClimbNew:  (areaId)          => "/areas/#{areaId}/climbs/new"
  @areaClimb:     (areaId, climbId) => "/areas/#{areaId}/climbs/#{climbId}"
  @areaClimbEdit: (areaId, climbId) => "/areas/#{areaId}/climbs/#{climbId}/edit"

  @areaClimbPhotoNew:     (areaId, climbId) =>
    "/areas/#{areaId}/climbs/#{climbId}/photos/new"
  @areaClimbPhotoGallery: (areaId, climbId, photoId) =>
    "/areas/#{areaId}/climbs/#{climbId}/photos/#{photoId}"
