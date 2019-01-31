# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'magic-the-gathering' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'SwiftLint', '~> 0.30.1'
  pod 'SnapKit', '~> 4.2.0'
  pod 'Nuke', '~> 7.5.2'
  pod 'Reusable', '~> 4.0.5'
  pod 'R.swift', '~> 5.0.2'
  pod 'SwiftFormat/CLI', '~> 0.37.4'
  pod 'RealmSwift', '3.13.1'
  
  # Pods for magic-the-gathering

  target 'magic-the-gatheringTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick', '~> 1.3.2'
    pod 'Nimble', '~> 7.3.2'
    pod 'Nimble-Snapshots', '~> 6.9.0'

    target 'magic-the-gatheringKIFTests' do
      inherit! :search_paths
      # Pods for testing
      pod 'KIF', '~> 3.7.4', :configurations => ['Debug']
    end
 
  end

end
