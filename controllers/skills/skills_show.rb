class SkillsShow
  SKILLS_BY_TYPES = {
    'active_skill' => %w[ascetic_strike precise_strike strong_strike traumatic_strike],
    'passive_skill' => %w[berserk concentration dazed shield_master],
    'camp_skill' => %w[bloody_ritual first_aid treasure_hunter],
    'all' => [
      'ascetic_strike', 'precise_strike', 'strong_strike', 'traumatic_strike',
      'berserk', 'concentration', 'dazed', 'shield_master',
      'bloody_ritual', 'first_aid', 'treasure_hunter'
    ]
  }

  def initialize(skill_type='all')
    @skills = SKILLS_BY_TYPES[skill_type]
  end

  def show_in_hero_creator(hero, separator=0, offset=false)
    separator = 0 if @skills.length > 14
    skills_list = @skills.map.with_index(1) do |skill_code, i|
      skill = SkillsCreator.create(skill_code, hero)
      aligned_skill_name = skill.name + (' ' * (20 - skill.name.length))
      ["   [Enter #{i}]   #{aligned_skill_name} #{skill.description_short}"] + [''] * separator
    end.flatten
    skills_list = [''] * ((29 - skills_list.length) / 4) + skills_list if offset
    skills_list
  end

  def SkillsShow.indexes_of_type(skill_type)
    SKILLS_BY_TYPES[skill_type].map.with_index(1){|_,i| i.to_s}
  end

  def SkillsShow.skill_code_by_index(skill_type, i)
    SKILLS_BY_TYPES[skill_type][i]
  end

end
