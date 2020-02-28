#samples
intro="C:/Users/logan_evans/Downloads/audacity sounds/kaliuintro.wav"
melody="C:/Users/logan_evans/Downloads/audacity sounds/kalisample.wav"
vocalone="C:/Users/logan_evans/Downloads/audacity sounds/vocalone.wav"
vocaltwo="C:/Users/logan_evans/Downloads/audacity sounds/vocaltwo.wav"
vocalthr="C:/Users/logan_evans/Downloads/audacity sounds/vocalsthree.wav"
rain="C:/Users/logan_evans/Downloads/audacity sounds/friendssss.wav"
tyler="C:/Users/logan_evans/Downloads/audacity sounds/tylerpart.wav"


define :kalinotesone do
  x=1
  live_loop:one do
    use_bpm 140
    use_synth:piano
    1. times do
      play :b5, amp:x
      play:gs5, amp:x
      sleep 2
      play:e4, amp:x
      sleep 2
      play:c5, amp:x
      sleep 4
      sleep 4
      play :d4, amp:x
      sleep 2.5
      play:b3, amp:x
      sleep 1
      play :c4, amp:x
      sleep 0.5
      play:b3, amp:x
      sleep 1.5
      play :gs3, amp:x
      sleep 1.5
      play :b3, amp:x
    end
    stop
  end
end
define :kalinotestwo do
  x=1
  live_loop:two do
    use_bpm 140
    use_synth:piano
    1. times do
      play:e3, amp:x
      sleep 4
      play:g3, amp:x
      play:e3, amp:x
      play :a2, amp:x
      sleep 2
      play:b3, amp:x
      sleep 0.5
      play:b3, amp:x
      sleep 0.5
      play:b3, amp:x
      sleep 1
      play :b3, amp:x
      sleep 1
      play:a3, amp:x
      sleep 1
      play:e3, amp:x
      sleep 0.5
      play:a3, amp:x
      sleep 0.5
      play :fs3, amp:x
      sleep 0.5
      play :a3, amp:x
      sleep 0.5
      play:a3, amp:x
      play:fs3, amp:x
      play:b2, amp:x
      sleep 1.5
      play :b2, amp:x
      sleep 0.5
      play:b3, amp:x
      sleep 1
      play:e3, amp:x
      play:e2, amp:x
      sleep 2
      play:a3, amp:x
      sleep 1
      play:a3, amp:x
      sleep 1
      play:e3, amp:x
      sleep 1
    end
    stop
  end
end
#customsong
define:drum_beat do|drumone, s1, drumtwo, s2, drumthree, s3, drumfour, s4|
  2.times do
    sample drumone,amp: rrand(0.5,1)
    sleep s1
    sample drumtwo,amp: rrand(0.5,1)
    sleep s2
    sample drumthree,amp: rrand(0.5,1)
    sleep s3
    sample drumfour,amp: rrand(0.5,1)
    sleep s4
  end
end

sample intro
print sample_duration intro
sleep 4.2
drum_beat:drum_snare_soft,0.5,:drum_snare_soft,0.5,:drum_snare_soft,0.5,:drum_snare_soft,0.5
drum_beat:drum_heavy_kick,1,:drum_heavy_kick,1,:drum_heavy_kick,1,:drum_heavy_kick,1

x=1
live_loop:melody do
  sample melody,amp:x
  print sample_duration melody
  x=x-0.75
  sleep 2
  kalinotesone
  kalinotestwo
  sleep 14.7
  if x<0.25
    sleep 6
    sample tyler
    print sample_duration tyler
    sleep 4
    1. times do
      kalinotesone
      kalinotestwo
      sleep 8
      sample rain
    end
    stop
  end
end
myvocals=[vocalone,vocaltwo,vocalthr]
print sample_duration vocalone
print sample_duration vocaltwo
print sample_duration vocalthr
rests=[5,6,7]
index=0
rests_index=0
live_loop:vocals do
  3.times do
    sample myvocals[index]
    sleep rests[index]
    index=index+1
    rests_index=rests_index+1
  end
  stop
end
