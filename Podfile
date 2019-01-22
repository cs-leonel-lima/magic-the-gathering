# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'magic-the-gathering' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'SwiftLint'
  pod 'SnapKit'
  pod 'Nuke'
  
  # Pods for magic-the-gathering

  target 'magic-the-gatheringTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
    pod 'Nimble-Snapshots'

    target 'magic-the-gatheringKIFTests' do
      inherit! :search_paths
      # Pods for testing
      pod 'KIF', :configurations => ['Debug']
    end
 
  end

end
